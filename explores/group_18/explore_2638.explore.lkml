# Update for 2000 file diff target
# Explore: explore_2638
# Auto-generated LookML Explore File

include: "/views/domain_15/view_07915.view.lkml"
include: "/views/domain_17/view_07917.view.lkml"
include: "/views/domain_18/view_07918.view.lkml"
include: "/views/domain_19/view_07919.view.lkml"

explore: explore_2638 {
  label: "Explore Explore 2638"
  description: "Comprehensive analytics explore joining base view_07915 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07915
  
  always_filter: {
    filters: [view_07915.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07915.created_at_date: "7 days"]
    unless: [view_07915.id, view_07915.status]
  }

  join: view_07917 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07915.user_id} = ${view_07917.id} ;;
    required_joins: []
  }

  join: view_07918 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07915.account_id} = ${view_07918.account_id} ;;
    required_joins: [view_07917]
  }

  join: view_07919 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07915.category} = ${view_07919.category} ;;
  }

  access_filter: {
    field: view_07915.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07915.is_deleted} = false ;;
}
