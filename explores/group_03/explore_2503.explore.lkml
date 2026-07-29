# Explore: explore_2503
# Auto-generated LookML Explore File

include: "/views/domain_10/view_07510.view.lkml"
include: "/views/domain_12/view_07512.view.lkml"
include: "/views/domain_13/view_07513.view.lkml"
include: "/views/domain_14/view_07514.view.lkml"

explore: explore_2503 {
  label: "Explore Explore 2503"
  description: "Comprehensive analytics explore joining base view_07510 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07510
  
  always_filter: {
    filters: [view_07510.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07510.created_at_date: "7 days"]
    unless: [view_07510.id, view_07510.status]
  }

  join: view_07512 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07510.user_id} = ${view_07512.id} ;;
    required_joins: []
  }

  join: view_07513 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07510.account_id} = ${view_07513.account_id} ;;
    required_joins: [view_07512]
  }

  join: view_07514 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07510.category} = ${view_07514.category} ;;
  }

  access_filter: {
    field: view_07510.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07510.is_deleted} = false ;;
}
