# Explore: explore_1684
# Auto-generated LookML Explore File

include: "/views/domain_03/view_05053.view.lkml"
include: "/views/domain_05/view_05055.view.lkml"
include: "/views/domain_06/view_05056.view.lkml"
include: "/views/domain_07/view_05057.view.lkml"

explore: explore_1684 {
  label: "Explore Explore 1684"
  description: "Comprehensive analytics explore joining base view_05053 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05053
  
  always_filter: {
    filters: [view_05053.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05053.created_at_date: "7 days"]
    unless: [view_05053.id, view_05053.status]
  }

  join: view_05055 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05053.user_id} = ${view_05055.id} ;;
    required_joins: []
  }

  join: view_05056 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05053.account_id} = ${view_05056.account_id} ;;
    required_joins: [view_05055]
  }

  join: view_05057 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05053.category} = ${view_05057.category} ;;
  }

  access_filter: {
    field: view_05053.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05053.is_deleted} = false ;;
}
