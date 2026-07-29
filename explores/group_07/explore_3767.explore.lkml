# Explore: explore_3767
# Auto-generated LookML Explore File

include: "/views/domain_02/view_11302.view.lkml"
include: "/views/domain_04/view_11304.view.lkml"
include: "/views/domain_05/view_11305.view.lkml"
include: "/views/domain_06/view_11306.view.lkml"

explore: explore_3767 {
  label: "Explore Explore 3767"
  description: "Comprehensive analytics explore joining base view_11302 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11302
  
  always_filter: {
    filters: [view_11302.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11302.created_at_date: "7 days"]
    unless: [view_11302.id, view_11302.status]
  }

  join: view_11304 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11302.user_id} = ${view_11304.id} ;;
    required_joins: []
  }

  join: view_11305 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11302.account_id} = ${view_11305.account_id} ;;
    required_joins: [view_11304]
  }

  join: view_11306 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11302.category} = ${view_11306.category} ;;
  }

  access_filter: {
    field: view_11302.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11302.is_deleted} = false ;;
}
