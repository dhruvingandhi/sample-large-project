# Update for 2000 file diff target
# Explore: explore_1638
# Auto-generated LookML Explore File

include: "/views/domain_15/view_04915.view.lkml"
include: "/views/domain_17/view_04917.view.lkml"
include: "/views/domain_18/view_04918.view.lkml"
include: "/views/domain_19/view_04919.view.lkml"

explore: explore_1638 {
  label: "Explore Explore 1638"
  description: "Comprehensive analytics explore joining base view_04915 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04915
  
  always_filter: {
    filters: [view_04915.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04915.created_at_date: "7 days"]
    unless: [view_04915.id, view_04915.status]
  }

  join: view_04917 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04915.user_id} = ${view_04917.id} ;;
    required_joins: []
  }

  join: view_04918 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04915.account_id} = ${view_04918.account_id} ;;
    required_joins: [view_04917]
  }

  join: view_04919 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04915.category} = ${view_04919.category} ;;
  }

  access_filter: {
    field: view_04915.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04915.is_deleted} = false ;;
}
