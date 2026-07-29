# Explore: explore_1735
# Auto-generated LookML Explore File

include: "/views/domain_06/view_05206.view.lkml"
include: "/views/domain_08/view_05208.view.lkml"
include: "/views/domain_09/view_05209.view.lkml"
include: "/views/domain_10/view_05210.view.lkml"

explore: explore_1735 {
  label: "Explore Explore 1735"
  description: "Comprehensive analytics explore joining base view_05206 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05206
  
  always_filter: {
    filters: [view_05206.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05206.created_at_date: "7 days"]
    unless: [view_05206.id, view_05206.status]
  }

  join: view_05208 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05206.user_id} = ${view_05208.id} ;;
    required_joins: []
  }

  join: view_05209 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05206.account_id} = ${view_05209.account_id} ;;
    required_joins: [view_05208]
  }

  join: view_05210 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05206.category} = ${view_05210.category} ;;
  }

  access_filter: {
    field: view_05206.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05206.is_deleted} = false ;;
}
