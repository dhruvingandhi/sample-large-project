# Explore: explore_2767
# Auto-generated LookML Explore File

include: "/views/domain_02/view_08302.view.lkml"
include: "/views/domain_04/view_08304.view.lkml"
include: "/views/domain_05/view_08305.view.lkml"
include: "/views/domain_06/view_08306.view.lkml"

explore: explore_2767 {
  label: "Explore Explore 2767"
  description: "Comprehensive analytics explore joining base view_08302 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08302
  
  always_filter: {
    filters: [view_08302.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08302.created_at_date: "7 days"]
    unless: [view_08302.id, view_08302.status]
  }

  join: view_08304 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08302.user_id} = ${view_08304.id} ;;
    required_joins: []
  }

  join: view_08305 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08302.account_id} = ${view_08305.account_id} ;;
    required_joins: [view_08304]
  }

  join: view_08306 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08302.category} = ${view_08306.category} ;;
  }

  access_filter: {
    field: view_08302.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08302.is_deleted} = false ;;
}
