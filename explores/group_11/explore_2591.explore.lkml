# Explore: explore_2591
# Auto-generated LookML Explore File

include: "/views/domain_24/view_07774.view.lkml"
include: "/views/domain_26/view_07776.view.lkml"
include: "/views/domain_27/view_07777.view.lkml"
include: "/views/domain_28/view_07778.view.lkml"

explore: explore_2591 {
  label: "Explore Explore 2591"
  description: "Comprehensive analytics explore joining base view_07774 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07774
  
  always_filter: {
    filters: [view_07774.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07774.created_at_date: "7 days"]
    unless: [view_07774.id, view_07774.status]
  }

  join: view_07776 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07774.user_id} = ${view_07776.id} ;;
    required_joins: []
  }

  join: view_07777 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07774.account_id} = ${view_07777.account_id} ;;
    required_joins: [view_07776]
  }

  join: view_07778 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07774.category} = ${view_07778.category} ;;
  }

  access_filter: {
    field: view_07774.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07774.is_deleted} = false ;;
}
