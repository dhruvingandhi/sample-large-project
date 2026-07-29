# Explore: explore_2109
# Auto-generated LookML Explore File

include: "/views/domain_28/view_06328.view.lkml"
include: "/views/domain_30/view_06330.view.lkml"
include: "/views/domain_31/view_06331.view.lkml"
include: "/views/domain_32/view_06332.view.lkml"

explore: explore_2109 {
  label: "Explore Explore 2109"
  description: "Comprehensive analytics explore joining base view_06328 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06328
  
  always_filter: {
    filters: [view_06328.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06328.created_at_date: "7 days"]
    unless: [view_06328.id, view_06328.status]
  }

  join: view_06330 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06328.user_id} = ${view_06330.id} ;;
    required_joins: []
  }

  join: view_06331 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06328.account_id} = ${view_06331.account_id} ;;
    required_joins: [view_06330]
  }

  join: view_06332 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06328.category} = ${view_06332.category} ;;
  }

  access_filter: {
    field: view_06328.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06328.is_deleted} = false ;;
}
