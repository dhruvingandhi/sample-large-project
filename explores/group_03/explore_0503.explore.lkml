# Explore: explore_0503
# Auto-generated LookML Explore File

include: "/views/domain_10/view_01510.view.lkml"
include: "/views/domain_12/view_01512.view.lkml"
include: "/views/domain_13/view_01513.view.lkml"
include: "/views/domain_14/view_01514.view.lkml"

explore: explore_0503 {
  label: "Explore Explore 0503"
  description: "Comprehensive analytics explore joining base view_01510 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01510
  
  always_filter: {
    filters: [view_01510.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01510.created_at_date: "7 days"]
    unless: [view_01510.id, view_01510.status]
  }

  join: view_01512 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01510.user_id} = ${view_01512.id} ;;
    required_joins: []
  }

  join: view_01513 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01510.account_id} = ${view_01513.account_id} ;;
    required_joins: [view_01512]
  }

  join: view_01514 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01510.category} = ${view_01514.category} ;;
  }

  access_filter: {
    field: view_01510.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01510.is_deleted} = false ;;
}
