# Explore: explore_3214
# Auto-generated LookML Explore File

include: "/views/domain_43/view_09643.view.lkml"
include: "/views/domain_45/view_09645.view.lkml"
include: "/views/domain_46/view_09646.view.lkml"
include: "/views/domain_47/view_09647.view.lkml"

explore: explore_3214 {
  label: "Explore Explore 3214"
  description: "Comprehensive analytics explore joining base view_09643 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09643
  
  always_filter: {
    filters: [view_09643.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09643.created_at_date: "7 days"]
    unless: [view_09643.id, view_09643.status]
  }

  join: view_09645 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09643.user_id} = ${view_09645.id} ;;
    required_joins: []
  }

  join: view_09646 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09643.account_id} = ${view_09646.account_id} ;;
    required_joins: [view_09645]
  }

  join: view_09647 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09643.category} = ${view_09647.category} ;;
  }

  access_filter: {
    field: view_09643.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09643.is_deleted} = false ;;
}
