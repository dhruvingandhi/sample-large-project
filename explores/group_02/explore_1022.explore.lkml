# Update for 500 file diff target
# Explore: explore_1022
# Auto-generated LookML Explore File

include: "/views/domain_17/view_03067.view.lkml"
include: "/views/domain_19/view_03069.view.lkml"
include: "/views/domain_20/view_03070.view.lkml"
include: "/views/domain_21/view_03071.view.lkml"

explore: explore_1022 {
  label: "Explore Explore 1022"
  description: "Comprehensive analytics explore joining base view_03067 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03067
  
  always_filter: {
    filters: [view_03067.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03067.created_at_date: "7 days"]
    unless: [view_03067.id, view_03067.status]
  }

  join: view_03069 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03067.user_id} = ${view_03069.id} ;;
    required_joins: []
  }

  join: view_03070 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03067.account_id} = ${view_03070.account_id} ;;
    required_joins: [view_03069]
  }

  join: view_03071 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03067.category} = ${view_03071.category} ;;
  }

  access_filter: {
    field: view_03067.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03067.is_deleted} = false ;;
}
