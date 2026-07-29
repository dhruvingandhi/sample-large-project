# Explore: explore_2953
# Auto-generated LookML Explore File

include: "/views/domain_10/view_08860.view.lkml"
include: "/views/domain_12/view_08862.view.lkml"
include: "/views/domain_13/view_08863.view.lkml"
include: "/views/domain_14/view_08864.view.lkml"

explore: explore_2953 {
  label: "Explore Explore 2953"
  description: "Comprehensive analytics explore joining base view_08860 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08860
  
  always_filter: {
    filters: [view_08860.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08860.created_at_date: "7 days"]
    unless: [view_08860.id, view_08860.status]
  }

  join: view_08862 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08860.user_id} = ${view_08862.id} ;;
    required_joins: []
  }

  join: view_08863 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08860.account_id} = ${view_08863.account_id} ;;
    required_joins: [view_08862]
  }

  join: view_08864 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08860.category} = ${view_08864.category} ;;
  }

  access_filter: {
    field: view_08860.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08860.is_deleted} = false ;;
}
