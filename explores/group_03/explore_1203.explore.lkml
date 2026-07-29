# Explore: explore_1203
# Auto-generated LookML Explore File

include: "/views/domain_10/view_03610.view.lkml"
include: "/views/domain_12/view_03612.view.lkml"
include: "/views/domain_13/view_03613.view.lkml"
include: "/views/domain_14/view_03614.view.lkml"

explore: explore_1203 {
  label: "Explore Explore 1203"
  description: "Comprehensive analytics explore joining base view_03610 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03610
  
  always_filter: {
    filters: [view_03610.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03610.created_at_date: "7 days"]
    unless: [view_03610.id, view_03610.status]
  }

  join: view_03612 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03610.user_id} = ${view_03612.id} ;;
    required_joins: []
  }

  join: view_03613 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03610.account_id} = ${view_03613.account_id} ;;
    required_joins: [view_03612]
  }

  join: view_03614 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03610.category} = ${view_03614.category} ;;
  }

  access_filter: {
    field: view_03610.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03610.is_deleted} = false ;;
}
