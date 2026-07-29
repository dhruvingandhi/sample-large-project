# Explore: explore_3564
# Auto-generated LookML Explore File

include: "/views/domain_43/view_10693.view.lkml"
include: "/views/domain_45/view_10695.view.lkml"
include: "/views/domain_46/view_10696.view.lkml"
include: "/views/domain_47/view_10697.view.lkml"

explore: explore_3564 {
  label: "Explore Explore 3564"
  description: "Comprehensive analytics explore joining base view_10693 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10693
  
  always_filter: {
    filters: [view_10693.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10693.created_at_date: "7 days"]
    unless: [view_10693.id, view_10693.status]
  }

  join: view_10695 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10693.user_id} = ${view_10695.id} ;;
    required_joins: []
  }

  join: view_10696 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10693.account_id} = ${view_10696.account_id} ;;
    required_joins: [view_10695]
  }

  join: view_10697 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10693.category} = ${view_10697.category} ;;
  }

  access_filter: {
    field: view_10693.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10693.is_deleted} = false ;;
}
