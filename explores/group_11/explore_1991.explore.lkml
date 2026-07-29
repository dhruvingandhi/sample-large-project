# Explore: explore_1991
# Auto-generated LookML Explore File

include: "/views/domain_24/view_05974.view.lkml"
include: "/views/domain_26/view_05976.view.lkml"
include: "/views/domain_27/view_05977.view.lkml"
include: "/views/domain_28/view_05978.view.lkml"

explore: explore_1991 {
  label: "Explore Explore 1991"
  description: "Comprehensive analytics explore joining base view_05974 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05974
  
  always_filter: {
    filters: [view_05974.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05974.created_at_date: "7 days"]
    unless: [view_05974.id, view_05974.status]
  }

  join: view_05976 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05974.user_id} = ${view_05976.id} ;;
    required_joins: []
  }

  join: view_05977 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05974.account_id} = ${view_05977.account_id} ;;
    required_joins: [view_05976]
  }

  join: view_05978 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05974.category} = ${view_05978.category} ;;
  }

  access_filter: {
    field: view_05974.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05974.is_deleted} = false ;;
}
