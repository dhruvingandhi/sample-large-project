# Explore: explore_1349
# Auto-generated LookML Explore File

include: "/views/domain_48/view_04048.view.lkml"
include: "/views/domain_50/view_04050.view.lkml"
include: "/views/domain_01/view_04051.view.lkml"
include: "/views/domain_02/view_04052.view.lkml"

explore: explore_1349 {
  label: "Explore Explore 1349"
  description: "Comprehensive analytics explore joining base view_04048 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04048
  
  always_filter: {
    filters: [view_04048.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04048.created_at_date: "7 days"]
    unless: [view_04048.id, view_04048.status]
  }

  join: view_04050 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04048.user_id} = ${view_04050.id} ;;
    required_joins: []
  }

  join: view_04051 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04048.account_id} = ${view_04051.account_id} ;;
    required_joins: [view_04050]
  }

  join: view_04052 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04048.category} = ${view_04052.category} ;;
  }

  access_filter: {
    field: view_04048.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04048.is_deleted} = false ;;
}
