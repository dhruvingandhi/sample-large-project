# Explore: explore_2482
# Auto-generated LookML Explore File

include: "/views/domain_47/view_07447.view.lkml"
include: "/views/domain_49/view_07449.view.lkml"
include: "/views/domain_50/view_07450.view.lkml"
include: "/views/domain_01/view_07451.view.lkml"

explore: explore_2482 {
  label: "Explore Explore 2482"
  description: "Comprehensive analytics explore joining base view_07447 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07447
  
  always_filter: {
    filters: [view_07447.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07447.created_at_date: "7 days"]
    unless: [view_07447.id, view_07447.status]
  }

  join: view_07449 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07447.user_id} = ${view_07449.id} ;;
    required_joins: []
  }

  join: view_07450 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07447.account_id} = ${view_07450.account_id} ;;
    required_joins: [view_07449]
  }

  join: view_07451 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07447.category} = ${view_07451.category} ;;
  }

  access_filter: {
    field: view_07447.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07447.is_deleted} = false ;;
}
