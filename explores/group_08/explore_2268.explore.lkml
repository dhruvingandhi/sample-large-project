# Explore: explore_2268
# Auto-generated LookML Explore File

include: "/views/domain_05/view_06805.view.lkml"
include: "/views/domain_07/view_06807.view.lkml"
include: "/views/domain_08/view_06808.view.lkml"
include: "/views/domain_09/view_06809.view.lkml"

explore: explore_2268 {
  label: "Explore Explore 2268"
  description: "Comprehensive analytics explore joining base view_06805 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06805
  
  always_filter: {
    filters: [view_06805.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06805.created_at_date: "7 days"]
    unless: [view_06805.id, view_06805.status]
  }

  join: view_06807 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06805.user_id} = ${view_06807.id} ;;
    required_joins: []
  }

  join: view_06808 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06805.account_id} = ${view_06808.account_id} ;;
    required_joins: [view_06807]
  }

  join: view_06809 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06805.category} = ${view_06809.category} ;;
  }

  access_filter: {
    field: view_06805.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06805.is_deleted} = false ;;
}
