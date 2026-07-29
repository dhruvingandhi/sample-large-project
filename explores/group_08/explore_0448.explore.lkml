# Explore: explore_0448
# Auto-generated LookML Explore File

include: "/views/domain_45/view_01345.view.lkml"
include: "/views/domain_47/view_01347.view.lkml"
include: "/views/domain_48/view_01348.view.lkml"
include: "/views/domain_49/view_01349.view.lkml"

explore: explore_0448 {
  label: "Explore Explore 0448"
  description: "Comprehensive analytics explore joining base view_01345 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01345
  
  always_filter: {
    filters: [view_01345.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01345.created_at_date: "7 days"]
    unless: [view_01345.id, view_01345.status]
  }

  join: view_01347 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01345.user_id} = ${view_01347.id} ;;
    required_joins: []
  }

  join: view_01348 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01345.account_id} = ${view_01348.account_id} ;;
    required_joins: [view_01347]
  }

  join: view_01349 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01345.category} = ${view_01349.category} ;;
  }

  access_filter: {
    field: view_01345.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01345.is_deleted} = false ;;
}
