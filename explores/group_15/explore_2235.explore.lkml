# Explore: explore_2235
# Auto-generated LookML Explore File

include: "/views/domain_06/view_06706.view.lkml"
include: "/views/domain_08/view_06708.view.lkml"
include: "/views/domain_09/view_06709.view.lkml"
include: "/views/domain_10/view_06710.view.lkml"

explore: explore_2235 {
  label: "Explore Explore 2235"
  description: "Comprehensive analytics explore joining base view_06706 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06706
  
  always_filter: {
    filters: [view_06706.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06706.created_at_date: "7 days"]
    unless: [view_06706.id, view_06706.status]
  }

  join: view_06708 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06706.user_id} = ${view_06708.id} ;;
    required_joins: []
  }

  join: view_06709 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06706.account_id} = ${view_06709.account_id} ;;
    required_joins: [view_06708]
  }

  join: view_06710 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06706.category} = ${view_06710.category} ;;
  }

  access_filter: {
    field: view_06706.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06706.is_deleted} = false ;;
}
