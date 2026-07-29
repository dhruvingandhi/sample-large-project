# Explore: explore_2426
# Auto-generated LookML Explore File

include: "/views/domain_29/view_07279.view.lkml"
include: "/views/domain_31/view_07281.view.lkml"
include: "/views/domain_32/view_07282.view.lkml"
include: "/views/domain_33/view_07283.view.lkml"

explore: explore_2426 {
  label: "Explore Explore 2426"
  description: "Comprehensive analytics explore joining base view_07279 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07279
  
  always_filter: {
    filters: [view_07279.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07279.created_at_date: "7 days"]
    unless: [view_07279.id, view_07279.status]
  }

  join: view_07281 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07279.user_id} = ${view_07281.id} ;;
    required_joins: []
  }

  join: view_07282 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07279.account_id} = ${view_07282.account_id} ;;
    required_joins: [view_07281]
  }

  join: view_07283 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07279.category} = ${view_07283.category} ;;
  }

  access_filter: {
    field: view_07279.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07279.is_deleted} = false ;;
}
