# Explore: explore_2781
# Auto-generated LookML Explore File

include: "/views/domain_44/view_08344.view.lkml"
include: "/views/domain_46/view_08346.view.lkml"
include: "/views/domain_47/view_08347.view.lkml"
include: "/views/domain_48/view_08348.view.lkml"

explore: explore_2781 {
  label: "Explore Explore 2781"
  description: "Comprehensive analytics explore joining base view_08344 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08344
  
  always_filter: {
    filters: [view_08344.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08344.created_at_date: "7 days"]
    unless: [view_08344.id, view_08344.status]
  }

  join: view_08346 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08344.user_id} = ${view_08346.id} ;;
    required_joins: []
  }

  join: view_08347 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08344.account_id} = ${view_08347.account_id} ;;
    required_joins: [view_08346]
  }

  join: view_08348 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08344.category} = ${view_08348.category} ;;
  }

  access_filter: {
    field: view_08344.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08344.is_deleted} = false ;;
}
