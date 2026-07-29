# Explore: explore_0629
# Auto-generated LookML Explore File

include: "/views/domain_38/view_01888.view.lkml"
include: "/views/domain_40/view_01890.view.lkml"
include: "/views/domain_41/view_01891.view.lkml"
include: "/views/domain_42/view_01892.view.lkml"

explore: explore_0629 {
  label: "Explore Explore 0629"
  description: "Comprehensive analytics explore joining base view_01888 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01888
  
  always_filter: {
    filters: [view_01888.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01888.created_at_date: "7 days"]
    unless: [view_01888.id, view_01888.status]
  }

  join: view_01890 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01888.user_id} = ${view_01890.id} ;;
    required_joins: []
  }

  join: view_01891 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01888.account_id} = ${view_01891.account_id} ;;
    required_joins: [view_01890]
  }

  join: view_01892 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01888.category} = ${view_01892.category} ;;
  }

  access_filter: {
    field: view_01888.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01888.is_deleted} = false ;;
}
