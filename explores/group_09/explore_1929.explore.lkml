# Explore: explore_1929
# Auto-generated LookML Explore File

include: "/views/domain_38/view_05788.view.lkml"
include: "/views/domain_40/view_05790.view.lkml"
include: "/views/domain_41/view_05791.view.lkml"
include: "/views/domain_42/view_05792.view.lkml"

explore: explore_1929 {
  label: "Explore Explore 1929"
  description: "Comprehensive analytics explore joining base view_05788 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05788
  
  always_filter: {
    filters: [view_05788.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05788.created_at_date: "7 days"]
    unless: [view_05788.id, view_05788.status]
  }

  join: view_05790 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05788.user_id} = ${view_05790.id} ;;
    required_joins: []
  }

  join: view_05791 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05788.account_id} = ${view_05791.account_id} ;;
    required_joins: [view_05790]
  }

  join: view_05792 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05788.category} = ${view_05792.category} ;;
  }

  access_filter: {
    field: view_05788.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05788.is_deleted} = false ;;
}
