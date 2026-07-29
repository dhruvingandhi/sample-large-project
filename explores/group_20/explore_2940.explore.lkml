# Explore: explore_2940
# Auto-generated LookML Explore File

include: "/views/domain_21/view_08821.view.lkml"
include: "/views/domain_23/view_08823.view.lkml"
include: "/views/domain_24/view_08824.view.lkml"
include: "/views/domain_25/view_08825.view.lkml"

explore: explore_2940 {
  label: "Explore Explore 2940"
  description: "Comprehensive analytics explore joining base view_08821 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08821
  
  always_filter: {
    filters: [view_08821.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08821.created_at_date: "7 days"]
    unless: [view_08821.id, view_08821.status]
  }

  join: view_08823 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08821.user_id} = ${view_08823.id} ;;
    required_joins: []
  }

  join: view_08824 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08821.account_id} = ${view_08824.account_id} ;;
    required_joins: [view_08823]
  }

  join: view_08825 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08821.category} = ${view_08825.category} ;;
  }

  access_filter: {
    field: view_08821.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08821.is_deleted} = false ;;
}
