# Explore: explore_1317
# Auto-generated LookML Explore File

include: "/views/domain_02/view_03952.view.lkml"
include: "/views/domain_04/view_03954.view.lkml"
include: "/views/domain_05/view_03955.view.lkml"
include: "/views/domain_06/view_03956.view.lkml"

explore: explore_1317 {
  label: "Explore Explore 1317"
  description: "Comprehensive analytics explore joining base view_03952 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03952
  
  always_filter: {
    filters: [view_03952.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03952.created_at_date: "7 days"]
    unless: [view_03952.id, view_03952.status]
  }

  join: view_03954 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03952.user_id} = ${view_03954.id} ;;
    required_joins: []
  }

  join: view_03955 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03952.account_id} = ${view_03955.account_id} ;;
    required_joins: [view_03954]
  }

  join: view_03956 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03952.category} = ${view_03956.category} ;;
  }

  access_filter: {
    field: view_03952.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03952.is_deleted} = false ;;
}
