# Explore: explore_0767
# Auto-generated LookML Explore File

include: "/views/domain_02/view_02302.view.lkml"
include: "/views/domain_04/view_02304.view.lkml"
include: "/views/domain_05/view_02305.view.lkml"
include: "/views/domain_06/view_02306.view.lkml"

explore: explore_0767 {
  label: "Explore Explore 0767"
  description: "Comprehensive analytics explore joining base view_02302 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02302
  
  always_filter: {
    filters: [view_02302.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02302.created_at_date: "7 days"]
    unless: [view_02302.id, view_02302.status]
  }

  join: view_02304 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02302.user_id} = ${view_02304.id} ;;
    required_joins: []
  }

  join: view_02305 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02302.account_id} = ${view_02305.account_id} ;;
    required_joins: [view_02304]
  }

  join: view_02306 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02302.category} = ${view_02306.category} ;;
  }

  access_filter: {
    field: view_02302.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02302.is_deleted} = false ;;
}
