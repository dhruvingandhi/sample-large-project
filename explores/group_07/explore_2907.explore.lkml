# Explore: explore_2907
# Auto-generated LookML Explore File

include: "/views/domain_22/view_08722.view.lkml"
include: "/views/domain_24/view_08724.view.lkml"
include: "/views/domain_25/view_08725.view.lkml"
include: "/views/domain_26/view_08726.view.lkml"

explore: explore_2907 {
  label: "Explore Explore 2907"
  description: "Comprehensive analytics explore joining base view_08722 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08722
  
  always_filter: {
    filters: [view_08722.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08722.created_at_date: "7 days"]
    unless: [view_08722.id, view_08722.status]
  }

  join: view_08724 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08722.user_id} = ${view_08724.id} ;;
    required_joins: []
  }

  join: view_08725 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08722.account_id} = ${view_08725.account_id} ;;
    required_joins: [view_08724]
  }

  join: view_08726 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08722.category} = ${view_08726.category} ;;
  }

  access_filter: {
    field: view_08722.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08722.is_deleted} = false ;;
}
