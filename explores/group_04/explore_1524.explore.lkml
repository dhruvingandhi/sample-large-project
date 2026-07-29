# Explore: explore_1524
# Auto-generated LookML Explore File

include: "/views/domain_23/view_04573.view.lkml"
include: "/views/domain_25/view_04575.view.lkml"
include: "/views/domain_26/view_04576.view.lkml"
include: "/views/domain_27/view_04577.view.lkml"

explore: explore_1524 {
  label: "Explore Explore 1524"
  description: "Comprehensive analytics explore joining base view_04573 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04573
  
  always_filter: {
    filters: [view_04573.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04573.created_at_date: "7 days"]
    unless: [view_04573.id, view_04573.status]
  }

  join: view_04575 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04573.user_id} = ${view_04575.id} ;;
    required_joins: []
  }

  join: view_04576 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04573.account_id} = ${view_04576.account_id} ;;
    required_joins: [view_04575]
  }

  join: view_04577 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04573.category} = ${view_04577.category} ;;
  }

  access_filter: {
    field: view_04573.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04573.is_deleted} = false ;;
}
