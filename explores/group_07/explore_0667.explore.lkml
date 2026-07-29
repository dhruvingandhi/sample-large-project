# Explore: explore_0667
# Auto-generated LookML Explore File

include: "/views/domain_02/view_02002.view.lkml"
include: "/views/domain_04/view_02004.view.lkml"
include: "/views/domain_05/view_02005.view.lkml"
include: "/views/domain_06/view_02006.view.lkml"

explore: explore_0667 {
  label: "Explore Explore 0667"
  description: "Comprehensive analytics explore joining base view_02002 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02002
  
  always_filter: {
    filters: [view_02002.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02002.created_at_date: "7 days"]
    unless: [view_02002.id, view_02002.status]
  }

  join: view_02004 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02002.user_id} = ${view_02004.id} ;;
    required_joins: []
  }

  join: view_02005 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02002.account_id} = ${view_02005.account_id} ;;
    required_joins: [view_02004]
  }

  join: view_02006 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02002.category} = ${view_02006.category} ;;
  }

  access_filter: {
    field: view_02002.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02002.is_deleted} = false ;;
}
