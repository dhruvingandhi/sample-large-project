# Explore: explore_1355
# Auto-generated LookML Explore File

include: "/views/domain_16/view_04066.view.lkml"
include: "/views/domain_18/view_04068.view.lkml"
include: "/views/domain_19/view_04069.view.lkml"
include: "/views/domain_20/view_04070.view.lkml"

explore: explore_1355 {
  label: "Explore Explore 1355"
  description: "Comprehensive analytics explore joining base view_04066 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04066
  
  always_filter: {
    filters: [view_04066.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04066.created_at_date: "7 days"]
    unless: [view_04066.id, view_04066.status]
  }

  join: view_04068 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04066.user_id} = ${view_04068.id} ;;
    required_joins: []
  }

  join: view_04069 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04066.account_id} = ${view_04069.account_id} ;;
    required_joins: [view_04068]
  }

  join: view_04070 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04066.category} = ${view_04070.category} ;;
  }

  access_filter: {
    field: view_04066.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04066.is_deleted} = false ;;
}
