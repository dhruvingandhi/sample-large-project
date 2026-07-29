# Explore: explore_1553
# Auto-generated LookML Explore File

include: "/views/domain_10/view_04660.view.lkml"
include: "/views/domain_12/view_04662.view.lkml"
include: "/views/domain_13/view_04663.view.lkml"
include: "/views/domain_14/view_04664.view.lkml"

explore: explore_1553 {
  label: "Explore Explore 1553"
  description: "Comprehensive analytics explore joining base view_04660 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04660
  
  always_filter: {
    filters: [view_04660.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04660.created_at_date: "7 days"]
    unless: [view_04660.id, view_04660.status]
  }

  join: view_04662 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04660.user_id} = ${view_04662.id} ;;
    required_joins: []
  }

  join: view_04663 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04660.account_id} = ${view_04663.account_id} ;;
    required_joins: [view_04662]
  }

  join: view_04664 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04660.category} = ${view_04664.category} ;;
  }

  access_filter: {
    field: view_04660.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04660.is_deleted} = false ;;
}
