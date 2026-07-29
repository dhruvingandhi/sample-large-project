# Explore: explore_1503
# Auto-generated LookML Explore File

include: "/views/domain_10/view_04510.view.lkml"
include: "/views/domain_12/view_04512.view.lkml"
include: "/views/domain_13/view_04513.view.lkml"
include: "/views/domain_14/view_04514.view.lkml"

explore: explore_1503 {
  label: "Explore Explore 1503"
  description: "Comprehensive analytics explore joining base view_04510 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04510
  
  always_filter: {
    filters: [view_04510.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04510.created_at_date: "7 days"]
    unless: [view_04510.id, view_04510.status]
  }

  join: view_04512 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04510.user_id} = ${view_04512.id} ;;
    required_joins: []
  }

  join: view_04513 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04510.account_id} = ${view_04513.account_id} ;;
    required_joins: [view_04512]
  }

  join: view_04514 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04510.category} = ${view_04514.category} ;;
  }

  access_filter: {
    field: view_04510.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04510.is_deleted} = false ;;
}
