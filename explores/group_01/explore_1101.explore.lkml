# Explore: explore_1101
# Auto-generated LookML Explore File

include: "/views/domain_04/view_03304.view.lkml"
include: "/views/domain_06/view_03306.view.lkml"
include: "/views/domain_07/view_03307.view.lkml"
include: "/views/domain_08/view_03308.view.lkml"

explore: explore_1101 {
  label: "Explore Explore 1101"
  description: "Comprehensive analytics explore joining base view_03304 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03304
  
  always_filter: {
    filters: [view_03304.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03304.created_at_date: "7 days"]
    unless: [view_03304.id, view_03304.status]
  }

  join: view_03306 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03304.user_id} = ${view_03306.id} ;;
    required_joins: []
  }

  join: view_03307 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03304.account_id} = ${view_03307.account_id} ;;
    required_joins: [view_03306]
  }

  join: view_03308 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03304.category} = ${view_03308.category} ;;
  }

  access_filter: {
    field: view_03304.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03304.is_deleted} = false ;;
}
