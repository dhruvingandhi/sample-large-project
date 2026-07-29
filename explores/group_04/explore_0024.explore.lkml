# Explore: explore_0024
# Auto-generated LookML Explore File

include: "/views/domain_23/view_00073.view.lkml"
include: "/views/domain_25/view_00075.view.lkml"
include: "/views/domain_26/view_00076.view.lkml"
include: "/views/domain_27/view_00077.view.lkml"

explore: explore_0024 {
  label: "Explore Explore 0024"
  description: "Comprehensive analytics explore joining base view_00073 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00073
  
  always_filter: {
    filters: [view_00073.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00073.created_at_date: "7 days"]
    unless: [view_00073.id, view_00073.status]
  }

  join: view_00075 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00073.user_id} = ${view_00075.id} ;;
    required_joins: []
  }

  join: view_00076 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00073.account_id} = ${view_00076.account_id} ;;
    required_joins: [view_00075]
  }

  join: view_00077 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00073.category} = ${view_00077.category} ;;
  }

  access_filter: {
    field: view_00073.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00073.is_deleted} = false ;;
}
