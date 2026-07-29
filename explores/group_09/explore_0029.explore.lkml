# Explore: explore_0029
# Auto-generated LookML Explore File

include: "/views/domain_38/view_00088.view.lkml"
include: "/views/domain_40/view_00090.view.lkml"
include: "/views/domain_41/view_00091.view.lkml"
include: "/views/domain_42/view_00092.view.lkml"

explore: explore_0029 {
  label: "Explore Explore 0029"
  description: "Comprehensive analytics explore joining base view_00088 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00088
  
  always_filter: {
    filters: [view_00088.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00088.created_at_date: "7 days"]
    unless: [view_00088.id, view_00088.status]
  }

  join: view_00090 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00088.user_id} = ${view_00090.id} ;;
    required_joins: []
  }

  join: view_00091 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00088.account_id} = ${view_00091.account_id} ;;
    required_joins: [view_00090]
  }

  join: view_00092 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00088.category} = ${view_00092.category} ;;
  }

  access_filter: {
    field: view_00088.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00088.is_deleted} = false ;;
}
