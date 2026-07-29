# Explore: explore_2205
# Auto-generated LookML Explore File

include: "/views/domain_16/view_06616.view.lkml"
include: "/views/domain_18/view_06618.view.lkml"
include: "/views/domain_19/view_06619.view.lkml"
include: "/views/domain_20/view_06620.view.lkml"

explore: explore_2205 {
  label: "Explore Explore 2205"
  description: "Comprehensive analytics explore joining base view_06616 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06616
  
  always_filter: {
    filters: [view_06616.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06616.created_at_date: "7 days"]
    unless: [view_06616.id, view_06616.status]
  }

  join: view_06618 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06616.user_id} = ${view_06618.id} ;;
    required_joins: []
  }

  join: view_06619 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06616.account_id} = ${view_06619.account_id} ;;
    required_joins: [view_06618]
  }

  join: view_06620 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06616.category} = ${view_06620.category} ;;
  }

  access_filter: {
    field: view_06616.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06616.is_deleted} = false ;;
}
