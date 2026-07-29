# Explore: explore_3482
# Auto-generated LookML Explore File

include: "/views/domain_47/view_10447.view.lkml"
include: "/views/domain_49/view_10449.view.lkml"
include: "/views/domain_50/view_10450.view.lkml"
include: "/views/domain_01/view_10451.view.lkml"

explore: explore_3482 {
  label: "Explore Explore 3482"
  description: "Comprehensive analytics explore joining base view_10447 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10447
  
  always_filter: {
    filters: [view_10447.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10447.created_at_date: "7 days"]
    unless: [view_10447.id, view_10447.status]
  }

  join: view_10449 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10447.user_id} = ${view_10449.id} ;;
    required_joins: []
  }

  join: view_10450 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10447.account_id} = ${view_10450.account_id} ;;
    required_joins: [view_10449]
  }

  join: view_10451 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10447.category} = ${view_10451.category} ;;
  }

  access_filter: {
    field: view_10447.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10447.is_deleted} = false ;;
}
