# Explore: explore_1574
# Auto-generated LookML Explore File

include: "/views/domain_23/view_04723.view.lkml"
include: "/views/domain_25/view_04725.view.lkml"
include: "/views/domain_26/view_04726.view.lkml"
include: "/views/domain_27/view_04727.view.lkml"

explore: explore_1574 {
  label: "Explore Explore 1574"
  description: "Comprehensive analytics explore joining base view_04723 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04723
  
  always_filter: {
    filters: [view_04723.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04723.created_at_date: "7 days"]
    unless: [view_04723.id, view_04723.status]
  }

  join: view_04725 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04723.user_id} = ${view_04725.id} ;;
    required_joins: []
  }

  join: view_04726 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04723.account_id} = ${view_04726.account_id} ;;
    required_joins: [view_04725]
  }

  join: view_04727 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04723.category} = ${view_04727.category} ;;
  }

  access_filter: {
    field: view_04723.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04723.is_deleted} = false ;;
}
