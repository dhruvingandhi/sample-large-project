# Explore: explore_1767
# Auto-generated LookML Explore File

include: "/views/domain_02/view_05302.view.lkml"
include: "/views/domain_04/view_05304.view.lkml"
include: "/views/domain_05/view_05305.view.lkml"
include: "/views/domain_06/view_05306.view.lkml"

explore: explore_1767 {
  label: "Explore Explore 1767"
  description: "Comprehensive analytics explore joining base view_05302 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05302
  
  always_filter: {
    filters: [view_05302.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05302.created_at_date: "7 days"]
    unless: [view_05302.id, view_05302.status]
  }

  join: view_05304 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05302.user_id} = ${view_05304.id} ;;
    required_joins: []
  }

  join: view_05305 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05302.account_id} = ${view_05305.account_id} ;;
    required_joins: [view_05304]
  }

  join: view_05306 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05302.category} = ${view_05306.category} ;;
  }

  access_filter: {
    field: view_05302.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05302.is_deleted} = false ;;
}
