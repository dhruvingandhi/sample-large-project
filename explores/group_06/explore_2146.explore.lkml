# Explore: explore_2146
# Auto-generated LookML Explore File

include: "/views/domain_39/view_06439.view.lkml"
include: "/views/domain_41/view_06441.view.lkml"
include: "/views/domain_42/view_06442.view.lkml"
include: "/views/domain_43/view_06443.view.lkml"

explore: explore_2146 {
  label: "Explore Explore 2146"
  description: "Comprehensive analytics explore joining base view_06439 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06439
  
  always_filter: {
    filters: [view_06439.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06439.created_at_date: "7 days"]
    unless: [view_06439.id, view_06439.status]
  }

  join: view_06441 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06439.user_id} = ${view_06441.id} ;;
    required_joins: []
  }

  join: view_06442 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06439.account_id} = ${view_06442.account_id} ;;
    required_joins: [view_06441]
  }

  join: view_06443 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06439.category} = ${view_06443.category} ;;
  }

  access_filter: {
    field: view_06439.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06439.is_deleted} = false ;;
}
