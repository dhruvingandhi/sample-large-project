# Explore: explore_1854
# Auto-generated LookML Explore File

include: "/views/domain_13/view_05563.view.lkml"
include: "/views/domain_15/view_05565.view.lkml"
include: "/views/domain_16/view_05566.view.lkml"
include: "/views/domain_17/view_05567.view.lkml"

explore: explore_1854 {
  label: "Explore Explore 1854"
  description: "Comprehensive analytics explore joining base view_05563 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05563
  
  always_filter: {
    filters: [view_05563.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05563.created_at_date: "7 days"]
    unless: [view_05563.id, view_05563.status]
  }

  join: view_05565 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05563.user_id} = ${view_05565.id} ;;
    required_joins: []
  }

  join: view_05566 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05563.account_id} = ${view_05566.account_id} ;;
    required_joins: [view_05565]
  }

  join: view_05567 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05563.category} = ${view_05567.category} ;;
  }

  access_filter: {
    field: view_05563.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05563.is_deleted} = false ;;
}
