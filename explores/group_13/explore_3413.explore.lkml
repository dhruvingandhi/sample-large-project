# Explore: explore_3413
# Auto-generated LookML Explore File

include: "/views/domain_40/view_10240.view.lkml"
include: "/views/domain_42/view_10242.view.lkml"
include: "/views/domain_43/view_10243.view.lkml"
include: "/views/domain_44/view_10244.view.lkml"

explore: explore_3413 {
  label: "Explore Explore 3413"
  description: "Comprehensive analytics explore joining base view_10240 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10240
  
  always_filter: {
    filters: [view_10240.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10240.created_at_date: "7 days"]
    unless: [view_10240.id, view_10240.status]
  }

  join: view_10242 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10240.user_id} = ${view_10242.id} ;;
    required_joins: []
  }

  join: view_10243 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10240.account_id} = ${view_10243.account_id} ;;
    required_joins: [view_10242]
  }

  join: view_10244 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10240.category} = ${view_10244.category} ;;
  }

  access_filter: {
    field: view_10240.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10240.is_deleted} = false ;;
}
