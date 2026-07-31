# Update for 500 file diff target
# Explore: explore_0962
# Auto-generated LookML Explore File

include: "/views/domain_37/view_02887.view.lkml"
include: "/views/domain_39/view_02889.view.lkml"
include: "/views/domain_40/view_02890.view.lkml"
include: "/views/domain_41/view_02891.view.lkml"

explore: explore_0962 {
  label: "Explore Explore 0962"
  description: "Comprehensive analytics explore joining base view_02887 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02887
  
  always_filter: {
    filters: [view_02887.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02887.created_at_date: "7 days"]
    unless: [view_02887.id, view_02887.status]
  }

  join: view_02889 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02887.user_id} = ${view_02889.id} ;;
    required_joins: []
  }

  join: view_02890 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02887.account_id} = ${view_02890.account_id} ;;
    required_joins: [view_02889]
  }

  join: view_02891 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02887.category} = ${view_02891.category} ;;
  }

  access_filter: {
    field: view_02887.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02887.is_deleted} = false ;;
}
