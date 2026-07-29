# Explore: explore_3638
# Auto-generated LookML Explore File

include: "/views/domain_15/view_10915.view.lkml"
include: "/views/domain_17/view_10917.view.lkml"
include: "/views/domain_18/view_10918.view.lkml"
include: "/views/domain_19/view_10919.view.lkml"

explore: explore_3638 {
  label: "Explore Explore 3638"
  description: "Comprehensive analytics explore joining base view_10915 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10915
  
  always_filter: {
    filters: [view_10915.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10915.created_at_date: "7 days"]
    unless: [view_10915.id, view_10915.status]
  }

  join: view_10917 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10915.user_id} = ${view_10917.id} ;;
    required_joins: []
  }

  join: view_10918 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10915.account_id} = ${view_10918.account_id} ;;
    required_joins: [view_10917]
  }

  join: view_10919 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10915.category} = ${view_10919.category} ;;
  }

  access_filter: {
    field: view_10915.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10915.is_deleted} = false ;;
}
