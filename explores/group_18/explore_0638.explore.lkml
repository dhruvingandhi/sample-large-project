# Update for 2000 file diff target
# Explore: explore_0638
# Auto-generated LookML Explore File

include: "/views/domain_15/view_01915.view.lkml"
include: "/views/domain_17/view_01917.view.lkml"
include: "/views/domain_18/view_01918.view.lkml"
include: "/views/domain_19/view_01919.view.lkml"

explore: explore_0638 {
  label: "Explore Explore 0638"
  description: "Comprehensive analytics explore joining base view_01915 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01915
  
  always_filter: {
    filters: [view_01915.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01915.created_at_date: "7 days"]
    unless: [view_01915.id, view_01915.status]
  }

  join: view_01917 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01915.user_id} = ${view_01917.id} ;;
    required_joins: []
  }

  join: view_01918 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01915.account_id} = ${view_01918.account_id} ;;
    required_joins: [view_01917]
  }

  join: view_01919 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01915.category} = ${view_01919.category} ;;
  }

  access_filter: {
    field: view_01915.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01915.is_deleted} = false ;;
}
