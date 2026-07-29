# Explore: explore_2693
# Auto-generated LookML Explore File

include: "/views/domain_30/view_08080.view.lkml"
include: "/views/domain_32/view_08082.view.lkml"
include: "/views/domain_33/view_08083.view.lkml"
include: "/views/domain_34/view_08084.view.lkml"

explore: explore_2693 {
  label: "Explore Explore 2693"
  description: "Comprehensive analytics explore joining base view_08080 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08080
  
  always_filter: {
    filters: [view_08080.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08080.created_at_date: "7 days"]
    unless: [view_08080.id, view_08080.status]
  }

  join: view_08082 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08080.user_id} = ${view_08082.id} ;;
    required_joins: []
  }

  join: view_08083 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08080.account_id} = ${view_08083.account_id} ;;
    required_joins: [view_08082]
  }

  join: view_08084 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08080.category} = ${view_08084.category} ;;
  }

  access_filter: {
    field: view_08080.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08080.is_deleted} = false ;;
}
