# Explore: explore_3574
# Auto-generated LookML Explore File

include: "/views/domain_23/view_10723.view.lkml"
include: "/views/domain_25/view_10725.view.lkml"
include: "/views/domain_26/view_10726.view.lkml"
include: "/views/domain_27/view_10727.view.lkml"

explore: explore_3574 {
  label: "Explore Explore 3574"
  description: "Comprehensive analytics explore joining base view_10723 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10723
  
  always_filter: {
    filters: [view_10723.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10723.created_at_date: "7 days"]
    unless: [view_10723.id, view_10723.status]
  }

  join: view_10725 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10723.user_id} = ${view_10725.id} ;;
    required_joins: []
  }

  join: view_10726 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10723.account_id} = ${view_10726.account_id} ;;
    required_joins: [view_10725]
  }

  join: view_10727 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10723.category} = ${view_10727.category} ;;
  }

  access_filter: {
    field: view_10723.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10723.is_deleted} = false ;;
}
