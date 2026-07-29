# Explore: explore_0253
# Auto-generated LookML Explore File

include: "/views/domain_10/view_00760.view.lkml"
include: "/views/domain_12/view_00762.view.lkml"
include: "/views/domain_13/view_00763.view.lkml"
include: "/views/domain_14/view_00764.view.lkml"

explore: explore_0253 {
  label: "Explore Explore 0253"
  description: "Comprehensive analytics explore joining base view_00760 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00760
  
  always_filter: {
    filters: [view_00760.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00760.created_at_date: "7 days"]
    unless: [view_00760.id, view_00760.status]
  }

  join: view_00762 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00760.user_id} = ${view_00762.id} ;;
    required_joins: []
  }

  join: view_00763 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00760.account_id} = ${view_00763.account_id} ;;
    required_joins: [view_00762]
  }

  join: view_00764 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00760.category} = ${view_00764.category} ;;
  }

  access_filter: {
    field: view_00760.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00760.is_deleted} = false ;;
}
