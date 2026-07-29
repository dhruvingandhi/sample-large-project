# Explore: explore_0735
# Auto-generated LookML Explore File

include: "/views/domain_06/view_02206.view.lkml"
include: "/views/domain_08/view_02208.view.lkml"
include: "/views/domain_09/view_02209.view.lkml"
include: "/views/domain_10/view_02210.view.lkml"

explore: explore_0735 {
  label: "Explore Explore 0735"
  description: "Comprehensive analytics explore joining base view_02206 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02206
  
  always_filter: {
    filters: [view_02206.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02206.created_at_date: "7 days"]
    unless: [view_02206.id, view_02206.status]
  }

  join: view_02208 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02206.user_id} = ${view_02208.id} ;;
    required_joins: []
  }

  join: view_02209 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02206.account_id} = ${view_02209.account_id} ;;
    required_joins: [view_02208]
  }

  join: view_02210 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02206.category} = ${view_02210.category} ;;
  }

  access_filter: {
    field: view_02206.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02206.is_deleted} = false ;;
}
