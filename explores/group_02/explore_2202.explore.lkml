# Update for 500 file diff target
# Explore: explore_2202
# Auto-generated LookML Explore File

include: "/views/domain_07/view_06607.view.lkml"
include: "/views/domain_09/view_06609.view.lkml"
include: "/views/domain_10/view_06610.view.lkml"
include: "/views/domain_11/view_06611.view.lkml"

explore: explore_2202 {
  label: "Explore Explore 2202"
  description: "Comprehensive analytics explore joining base view_06607 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06607
  
  always_filter: {
    filters: [view_06607.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06607.created_at_date: "7 days"]
    unless: [view_06607.id, view_06607.status]
  }

  join: view_06609 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06607.user_id} = ${view_06609.id} ;;
    required_joins: []
  }

  join: view_06610 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06607.account_id} = ${view_06610.account_id} ;;
    required_joins: [view_06609]
  }

  join: view_06611 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06607.category} = ${view_06611.category} ;;
  }

  access_filter: {
    field: view_06607.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06607.is_deleted} = false ;;
}
