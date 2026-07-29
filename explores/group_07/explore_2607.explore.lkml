# Explore: explore_2607
# Auto-generated LookML Explore File

include: "/views/domain_22/view_07822.view.lkml"
include: "/views/domain_24/view_07824.view.lkml"
include: "/views/domain_25/view_07825.view.lkml"
include: "/views/domain_26/view_07826.view.lkml"

explore: explore_2607 {
  label: "Explore Explore 2607"
  description: "Comprehensive analytics explore joining base view_07822 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07822
  
  always_filter: {
    filters: [view_07822.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07822.created_at_date: "7 days"]
    unless: [view_07822.id, view_07822.status]
  }

  join: view_07824 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07822.user_id} = ${view_07824.id} ;;
    required_joins: []
  }

  join: view_07825 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07822.account_id} = ${view_07825.account_id} ;;
    required_joins: [view_07824]
  }

  join: view_07826 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07822.category} = ${view_07826.category} ;;
  }

  access_filter: {
    field: view_07822.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07822.is_deleted} = false ;;
}
