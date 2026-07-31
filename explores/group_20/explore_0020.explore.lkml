# Update for 2000 file diff target
# Explore: explore_0020
# Auto-generated LookML Explore File

include: "/views/domain_11/view_00061.view.lkml"
include: "/views/domain_13/view_00063.view.lkml"
include: "/views/domain_14/view_00064.view.lkml"
include: "/views/domain_15/view_00065.view.lkml"

explore: explore_0020 {
  label: "Explore Explore 0020"
  description: "Comprehensive analytics explore joining base view_00061 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00061
  
  always_filter: {
    filters: [view_00061.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00061.created_at_date: "7 days"]
    unless: [view_00061.id, view_00061.status]
  }

  join: view_00063 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00061.user_id} = ${view_00063.id} ;;
    required_joins: []
  }

  join: view_00064 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00061.account_id} = ${view_00064.account_id} ;;
    required_joins: [view_00063]
  }

  join: view_00065 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00061.category} = ${view_00065.category} ;;
  }

  access_filter: {
    field: view_00061.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00061.is_deleted} = false ;;
}
