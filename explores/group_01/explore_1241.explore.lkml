# Explore: explore_1241
# Auto-generated LookML Explore File

include: "/views/domain_24/view_03724.view.lkml"
include: "/views/domain_26/view_03726.view.lkml"
include: "/views/domain_27/view_03727.view.lkml"
include: "/views/domain_28/view_03728.view.lkml"

explore: explore_1241 {
  label: "Explore Explore 1241"
  description: "Comprehensive analytics explore joining base view_03724 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03724
  
  always_filter: {
    filters: [view_03724.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03724.created_at_date: "7 days"]
    unless: [view_03724.id, view_03724.status]
  }

  join: view_03726 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03724.user_id} = ${view_03726.id} ;;
    required_joins: []
  }

  join: view_03727 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03724.account_id} = ${view_03727.account_id} ;;
    required_joins: [view_03726]
  }

  join: view_03728 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03724.category} = ${view_03728.category} ;;
  }

  access_filter: {
    field: view_03724.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03724.is_deleted} = false ;;
}
