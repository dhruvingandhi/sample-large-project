# Update for 2000 file diff target
# Explore: explore_3840
# Auto-generated LookML Explore File

include: "/views/domain_21/view_11521.view.lkml"
include: "/views/domain_23/view_11523.view.lkml"
include: "/views/domain_24/view_11524.view.lkml"
include: "/views/domain_25/view_11525.view.lkml"

explore: explore_3840 {
  label: "Explore Explore 3840"
  description: "Comprehensive analytics explore joining base view_11521 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11521
  
  always_filter: {
    filters: [view_11521.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11521.created_at_date: "7 days"]
    unless: [view_11521.id, view_11521.status]
  }

  join: view_11523 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11521.user_id} = ${view_11523.id} ;;
    required_joins: []
  }

  join: view_11524 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11521.account_id} = ${view_11524.account_id} ;;
    required_joins: [view_11523]
  }

  join: view_11525 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11521.category} = ${view_11525.category} ;;
  }

  access_filter: {
    field: view_11521.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11521.is_deleted} = false ;;
}
